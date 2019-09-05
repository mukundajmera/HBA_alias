install.packages('rsconnect')
data = read.table(file = "hello.txt",header = F,sep = ",",col.names = c("values"))
data = unique(data$values)
write_clip(content = data,object_type = "auto",breaks = NULL,return_new = F)
library(rsconnect)
rsconnect::setAccountInfo(name='mukundajmera',
                          token='339437085B1588CB1CC9AFDD8AC79E01',
                          secret='KXqLDf5QgUINkuTsVceGXLfPaVb0qWCjT/aONXU+')
rsconnect::deployApp('C:/Users/UMJ1KOR/Documents/HBA Alias')
