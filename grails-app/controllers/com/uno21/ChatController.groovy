package com.uno21

class ChatController {

    def index = { }
	
	def broadcast = {
		broadcaster['/atmosphere/chat'].broadcast(params.data)
	}
}
