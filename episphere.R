
episphere <- function(){
  #' epiSphere data platform
  #' 
  #' `epiSphere()` will initialize the data platform by loading tidyverse and logging into your Box.com account.
  #' Box will be used as the cloud-hosted, user-governed shared data space.
  #' @param none, Box authentication is checked by default.
  #' @keywords episphere, dceg, box.com
  #' @export
  #' @examples 
  #' episphere()
  episphere.require(c("boxr","tidyverse","docstring","bigrquery"))  # use collection for multiple libraries
  box_auth("627lww8un9twnoa8f9rjvldf7kb56q1m","gSKdYKLd65aQpZGrq9x4QVUNnn5C8qqm")
}

episphere.require <- function(pkj){
  #' require packages, will be installed if not available
  #' 
  #' @parm a string or a collection of strings indicating the package name.
  #' @examples
  #' episphere.require(c("diffobj","kaos"))
  #' episphere.require("diffobj")  
  if(typeof(pkj)=="character"){pkj=c(pkj)}
  lapply(
    pkj,
    function(x) {
      if (!require(x, character.only = TRUE)) {
        install.packages(x, dependencies = TRUE)
        library(x, character.only = TRUE)
      }
    }
  )
  paste("number of pkjs required:",length(pkj))
}

episphere.openURL <- function(url="https://github.com/episphere/r/blob/main/episphere.R"){
  utils::browseURL(url)
}

episphere.openFolder <- function(id=133596945131){
  episphere.openURL(paste("https://nih.app.box.com/folder/",id,sep=""))
  message(paste("folder #",id," opened in your browser",sep=""))
}

episphere.openFile <- function(id=787813783402,ver=NULL){
  url=paste("https://nih.app.box.com/file/",id,sep="")
  if(typeof(NULL)!="NULL"){
    url=paste(url,"?sb=/details/versions/",ver,sep="")
  }
  message(paste("browser tab opened at",url))
  episphere.openURL(url)
  # for example of a specific version, episphere.openFile(787813783402,841936237402)
}

episphere.read <- function(id=787813783402,ver=NULL){
  box_read(file_id=id,version_id=ver)
}

episphere.logout <- function(){
  # at some point make it granular, to distinguish, for example, Box from BigQuery
  box_fresh_auth()
}


episphere()

