
function get_machine_role()
{

  #TODO - lookup this machines role(s) 

  "WEB"

}

function port_check($address, $port)
{

  $client = new-object system.net.sockets.tcpclient($address, $port)
  $client.Close()         

}
