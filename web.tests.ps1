import-module .\testing.ps1
import-module .\helpers.ps1


# TODO - this needs to come from somewhere else
#
$VISIBROKER_PORT = 50503

role "WEB" {

  test "Port check CORBA ($VISIBROKER_PORT)" {
     
      #test connectivity to a remote endpoint
      #
      port_check "wddcsdwmsa293" $VISIBROKER_PORT
      
    }
    
  test "Environment variables" {
    
    assert "COMPUTERNAME exists"  { test-path env:\computername }
    assert "VISIBROKER_ADDR exists" { test-path env:\VISIBROKER_ADDR }
    assert "VISIBROKER_ADDR -eq $CORBA_PORT" { $env:VISIBROKER_ADDR -eq $VISIBROKER_PORT }      
    
  }
  
  test "Spooler service is running" {
  
    assert "Spooler service is running" { 
      (get-service spooler | select -expandproperty status) -eq "Running"
    }
    
  }
  
}
