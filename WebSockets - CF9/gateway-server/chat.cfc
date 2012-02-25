component {
	
	/*remote function onIncomingMessage(event) {
		
		writeLog(file='ocfs-chat', text='#serializeJson(event)#');
		return "hello!";

	}*/
	public function onIncomingMessage (event) {
		// do nothing!
		writeLog(file='ocfs-chat', text=serializeJson(arguments.event));
		var msg = {};
		msg["MESSAGE"]=event.data.message;
		return msg;
	}

	public function onOpen() {
		writeLog(file='ocfs-chat', text='connection opened');
		return true;
	}

	public function onClose() {
		writeLog(file='ocfs-chat', text='connection closed');
		return false;
	}

}
