package com.uno21

class ChatService {

	static transactional = false
	static atmosphere = [mapping: '/atmosphere/chat']
		  
	def onRequest = { event ->
		event.suspend()	
	}
	
	def onStateChange = { event ->
	
		if (!event.message) return
		
		event.resource.response.writer.with {
			write "<script>parent.callback('${event.message}');</script>"
			flush()
		}
	}
	
}
