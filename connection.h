//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//////////////////////////////////////////////////////////////////////

#ifndef __OTSERV_CONNECTION_H__
#define __OTSERV_CONNECTION_H__

#include "definitions.h"
#include <boost/asio.hpp>

#include <boost/utility.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/thread.hpp>

#include "networkmessage.h"

class Protocol;
class OutputMessage;
typedef boost::shared_ptr<OutputMessage> OutputMessage_ptr;
class Connection;
class ServiceBase;
typedef boost::shared_ptr<ServiceBase> Service_ptr;
class ServicePort;
typedef boost::shared_ptr<ServicePort> ServicePort_ptr;

#ifdef __DEBUG_NET__
#define PRINT_ASIO_ERROR(desc) \
	std::cout << "Error: [" << __FUNCTION__ << "] " << desc << " - Error: " <<  \
		error.value() << " Desc: " << error.message() << std::endl;
#else
#define PRINT_ASIO_ERROR(desc)
#endif

class ConnectionManager
{
public:
	~ConnectionManager()
	{
	}

	static ConnectionManager* getInstance(){
		static ConnectionManager instance;
		return &instance;
	}

	Connection* createConnection(boost::asio::ip::tcp::socket* socket,
		boost::asio::io_service& io_service, ServicePort_ptr servicers);
	void releaseConnection(Connection* connection);
	void closeAll();

protected:

	ConnectionManager()
	{
	}

	std::list<Connection*> m_connections;
	boost::recursive_mutex m_connectionManagerLock;
};

class Connection : boost::noncopyable
{
public:
#ifdef __ENABLE_SERVER_DIAGNOSTIC__
	static uint32_t connectionCount;
#endif

	enum {
		CLOSE_STATE_NONE = 0,
		CLOSE_STATE_REQUESTED = 1,
		CLOSE_STATE_CLOSING = 2,
	};

private:
	Connection(boost::asio::ip::tcp::socket* socket,
		boost::asio::io_service& io_service,
		ServicePort_ptr service_port) : 
			m_socket(socket),
			m_timer(io_service),
			m_io_service(io_service),
			m_service_port(service_port)
	{
		m_refCount = 0;
		m_protocol = NULL;
		m_pendingWrite = 0;
		m_pendingRead = 0;
		m_closeState = CLOSE_STATE_NONE;
		m_receivedFirst = false;
		m_socketClosed = false;
		m_writeError = false;
		m_readError = false;

#ifdef __ENABLE_SERVER_DIAGNOSTIC__
		connectionCount++;
#endif
	}
	friend class ConnectionManager;

public:
	~Connection()
	{
#ifdef __ENABLE_SERVER_DIAGNOSTIC__
		connectionCount--;
#endif
	}

	boost::asio::ip::tcp::socket& getHandle() { return *m_socket; }

	void closeConnection();
	// Used by protocols that require server to send first
	void acceptConnection(Protocol* protocol);
	void acceptConnection();

	bool send(OutputMessage_ptr msg);

	uint32_t getIP() const;

	int32_t addRef() {return ++m_refCount;}
	int32_t unRef() {return --m_refCount;}

private:
	void parseHeader(const boost::system::error_code& error);
	void parsePacket(const boost::system::error_code& error);

	void onWriteOperation(OutputMessage_ptr msg, const boost::system::error_code& error);
	void onStopOperation();

	void handleTimeout(const boost::system::error_code& error);
	void handleReadError(const boost::system::error_code& error);
	void handleWriteError(const boost::system::error_code& error);

	void closeConnectionTask();
	bool closingConnection();
	void deleteConnectionTask();
	void releaseConnection();

	void internalSend(OutputMessage_ptr msg);

	NetworkMessage m_msg;
	boost::asio::ip::tcp::socket* m_socket;
	boost::asio::deadline_timer m_timer;
	boost::asio::io_service& m_io_service;
	ServicePort_ptr m_service_port;
	bool m_socketClosed;
	bool m_receivedFirst;

	bool m_writeError;
	bool m_readError;

	int32_t m_pendingWrite;
	std::list <OutputMessage_ptr> m_outputQueue;
	int32_t m_pendingRead;
	uint32_t m_closeState;
	uint32_t m_refCount;

	boost::recursive_mutex m_connectionLock;

	Protocol* m_protocol;
};

#endif
