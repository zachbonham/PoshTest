

function role($rolename, [scriptblock]$block)
{

  #TODO - load external configuration/metadata for role
  $machine_role = get_machine_role


  write-host "loading [$rolename] tests for $([environment]::machinename)"
  write-host ""


  $block.invoke()

  write-host ""

}



function assert($description, [scriptblock]$block) {
  
  $result = & $block 

  if ( !$result )
  {
    throw "Assert failed: $description"

  }
  
}

function test($description, [scriptblock]$block) 
{

  try
  {
    & $block
    
    write-host -foregroundcolor green "[OK]" $description 
  }
  catch
  {
    write-host -foregroundcolor red "[ERROR]" $description  
    write-host "    Message: $_" -foregroundcolor gray
    
    exit 1
  }

}
