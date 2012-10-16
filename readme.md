# PoshTest
PostTest is a sample of a bare bones testing implementation with PowerShell.

Looking at something light weight to be able to create machine tests that will execute on a server (not remotely) and report whether they match the expected configurationf or that machines role.

But its mainly just a sample of how easy it is to build a domain specific language (DSL) with PowerShell blocks.

## Sample

  ```powershell
  . .\testing.ps1

  test "Spooler service is running" {
    
      assert "Spooler service is running" { 
        (get-service spooler | select -expandproperty status) -eq "Running"
      }
      
    }
```