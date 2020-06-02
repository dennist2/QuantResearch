#' @title dum9
#' @description Takes output from histXCII and tells you the return 
#' @param x a list or data.frame
#' @return returns the list/df but with return
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  lapply(dum9,LGNN)
#'  }
#' }
#' @rdname dum9
#' @export 
#' 

dum9 <- function(x){
  
  data <- x
  data$Date[1] -> r
  
  allF = data[c(which(data$Truth=="False")),]
  netF = sum(abs(allF$delta))
  
  allT = data[c(which(data$Truth=="True")),]
  netT = -1*(sum(abs(allT$delta)))
  
  NetProfit = netF+netT
  
  colnames(data) -> cols
  
  c(which(cols=="Go.to.")) -> pre_first
  cols[pre_first]
  
  cols[c(seq(pre_first+1,pre_first+3))] -> nar1
  
  stringr::str_replace_all(nar1,"\\.","-") -> nar
  stringr::str_remove(nar,"X") -> nar
  
  c(which(nar==as.character(data$Date[1]))) -> first_ind
  
  print("Date[1]:")
  print(data$Date[1])
  
  nar1[first_ind] -> first
  
  print("First")
  print(first)
  
  # cols[length(cols)-3] -> last
  
  ## Delete above
  if(length(cols)<20){
    last <- cols[length(cols)-3]
  } else {
    cols[18] -> last
  }
  
  print("Last")
  print(last)
  
  paste("allF$'",first,"'",sep = "") -> d1_F
  d1F <- parse(text=d1_F)
  
  paste("allF$'",last,"'",sep = "") -> d2_F
  d2F <- parse(text=d2_F)
  
  paste("allT$'",first,"'",sep = "") -> d1_T
  d1T <- parse(text=d1_T)
  
  paste("allT$'",last,"'",sep = "") -> d2_T
  d2T <- parse(text=d2_T)
  
  print(d1F)
  print(d2F)
  print(d1T)
  print(d2T)
  print("Net Profit")
  print(NetProfit)
  print("BREAK")
  print("                                                     ")
  
  
  output <- list(False=data.frame(Date=allF$Date,
                                  Symbol=allF$Symbol,
                                  Prior=allF$Pre,
                                  Price=allF$Price,
                                  Change=allF$Change,
                                  End=eval(d2F),
                                  Delta=allF$delta,
                                  Net=netF,
                                  Truth=allF$Truth,
                                  Dir=allF$Direction,
                                  StartDate=first,
                                  EndDate=last),
                 True=data.frame(Date=allT$Date,
                                 Symbol=allT$Symbol,
                                 Prior=allT$Pre,
                                 Price=allT$Price,
                                 Change=allT$Change,
                                 End=eval(d2T),
                                 Delta=allT$delta,
                                 Net=netT,
                                 Truth=allT$Truth,
                                 Dir=allT$Direction,
                                 StartDate=first,
                                 EndDate=last))
  output$False <- data.frame(output$False,type=ifelse(output$False$Change>0,"put","call"))
  output$True <- data.frame(output$True,type=ifelse(output$True$Change>0,"put","call"))
  out2 <- rbind(output$False,output$True)
  return(out2)
}
