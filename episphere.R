
episphere <- function(){
  # ini
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
}

episphere.openFile <- function(id=787813783402,ver=""){
  if(stringr::str_length(ver)==0){
    episphere.openURL(paste("https://nih.app.box.com/file/",id,sep=""))
  }else{
    episphere.openURL(paste("https://nih.app.box.com/file/",id,"?sb=/details/versions/",ver,sep=""))
  }
  # for example of a specific version, episphere.openFile(787813783402,841936237402)
}

episphere()