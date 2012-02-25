component{

    public function onClientOpen(Struct data){
    	writeLog(file="websocket", text="connection open");
    	return true;
    }

    public function onClientClose(Struct data){
    	return true;
    }

    public string function onMessage(Struct data){
    	writeLog(file="websockets", text="send message!");
    	return "test";
    }

}