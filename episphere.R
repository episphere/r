
#' epiSphere data platform
#' 
#' initialize epiSphere's data platform by loading and logging into Box.com
#' @param none, box authentication is started by default
#' @keywords episphere, dceg, box.com
#' @export
#' @examples 
#' episphere()

episphere <- function(){
  # ini
  # info on packaging at https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
  episphere.require(c("boxr","stringr"))  # use collection for multiple libraries
  box_auth("627lww8un9twnoa8f9rjvldf7kb56q1m","gSKdYKLd65aQpZGrq9x4QVUNnn5C8qqm")
}

episphere.require <- function(pkj){
  if(typeof(pkj)=="character"){pkj=c(pkj)}
  lapply(
    pkj,
    FUN = function(x) {
      if (!require(x, character.only = TRUE)) {
        install.packages(x, dependencies = TRUE)
        library(x, character.only = TRUE)
      }
    }
  )
}

episphere.openURL <- function(url="https://episphere.github.io/r"){
  utils::browseURL(url)
}

episphere.openFolder <- function(id=133596945131){
  episphere.openURL(paste("https://nih.app.box.com/folder/",id,sep=""))
  message(paste("folder #",id," opened in your browser",sep=""))
}

episphere.openFile <- function(id=787813783402,ver=""){
  if(stringr::str_length(ver)==0){
    episphere.openURL(paste("https://nih.app.box.com/file/",id,sep=""))
    message(paste("file #",id," opened in your browser",sep=""))
  }else{
    episphere.openURL(paste("https://nih.app.box.com/file/",id,"?sb=/details/versions/",ver,sep=""))
    message(paste("file #",id," version #",ver," opened in your browser",sep=""))
  }
  # for example of a specific version, episphere.openFile(787813783402,841936237402)
}

episphere()