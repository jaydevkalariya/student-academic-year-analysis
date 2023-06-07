        #  academic year analysis -2022 


conn = dbConnect(
  MySQL(),
  user='root',
  password='',
  dbname='student',
  host='localhost'
)



print("'w'. Insert");
print("'u'. update");
print("'d'. delete");
print("'r'. read");

choice <- readline(prompt = "Enter your choice : ");
print(choice);

if(choice=="r"){
  cat("in ", choice);
  res = dbGetQuery(conn,"select * from stud",n=5);
  print(res);
  dbClearResult(res)
  dbDisconnect(conn)
}else if(choice=="w"){

  # name = readline(prompt = "Enter name : ")
  # ID = readline(prompt = "Enter ID : ")
  # mobile = readline(prompt = "Enter mobile : ")
  # email = readline(prompt = "Enter email : ")
  # sp3 = readline(prompt = "Enter sem 3 spi : ")
  # spi3=as.numeric(sp3)
  # sp4 = readline(prompt = "Enter sem 4 spi : ")
  # spi4=as.numeric(sp4)
  # cpi = readline(prompt = "Enter cpi : ")
  # print(name)
  # print(ID)
  # n = readline(prompt = "enter 1 : ")
  # if(n==1)
  # {
    dbSendQuery(conn,
                "insert into stud values(
                'yalda muradi','yaldaafghani@afg.com','20CP040',
                '1245789632',4.20,5.23,4.25)");
    dbDisconnect(conn)
    print("inserted");
  # }

}else if(choice=="u"){
  dbSendQuery(conn,"update stud set name='Yalda tejas muradi' where ID='20CP040'");
  dbDisconnect(conn)
  print("uuuu");
}else if(choice=="d"){
  print("dddd");
  dbSendQuery(conn,"delete from stud where ID='20CP040'");
  dbDisconnect(conn)
}else{
  print("invalid choice")
}

# ->to disconnect all connection
# lapply(dbListConnections(MySQL()), dbDisconnect)

#-----------------------------------------------------------------


# cat("\n-----------------------------------------------------\n")
# 
# 
# 
# cat("find avg cpi of 2nd year\n")
# r3=dbSendQuery(conn1,"SELECT avg(cpi) from stud")
# avg = fetch(r3)
# cat("average cpi of 2nd year computer department is : \n");
# print(avg)
# dbDisconnect(conn1)
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# cat("display students whose result improved\n");
# r3=dbSendQuery(conn2,
#                "SELECT name,spi3,spi4 from stud where spi4>spi3")
# cpitable = fetch(r3)
# print(cpitable)
# dbDisconnect(conn2)
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# #topper of 2nd year
# cat("topper of 2nd year\n")
# r2=dbSendQuery(conn3,
#                "SELECT name,cpi FROM stud where cpi=(select max(cpi) from stud)")
# s = fetch(r2)
# write.csv(s,"backlog.csv",row.names = TRUE)
# cat("Topper is : \n")
# print(s)
# dbDisconnect(conn3)
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# 
# cat("display students who fail in sem4\n")
# r3=dbSendQuery(conn4,
#                "SELECT name,ID,spi4 from stud where spi4<5.00")
# failstu = fetch(r3)
# write.csv(failstu,"backlog.csv",row.names = TRUE)
# failed=dbSendQuery(conn4,
#                    "SELECT count(*) from stud where spi4<5.00")
# failcon = fetch(failed)
# print(failstu);
# cat("\n\ntotal failed students in sem 4 : ")
# print(failcon);
# 
# dbDisconnect(conn4)
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# 
# cat("compare result of both sem\n")
# avgspi3=dbSendQuery(conn5,
#                     "SELECT avg(spi3) from stud")
# s3 = fetch(avgspi3)
# dbClearResult(dbListResults(conn5)[[1]])
# 
# avgspi4=dbSendQuery(conn5,"SELECT avg(spi4) from stud")
# s4 = fetch(avgspi4)
# x=s3[1,"avg(spi3)"]
# y=s4[1,"avg(spi4)"]
# if(x<y)
# {
#   per=(x-y)*10;
#   cat("result improved by ",per,"%");
# }else{
#   per=(x-y)*10;
#   cat("result decreased by ",per,"%");
# }
# dbDisconnect(conn5)
# 
# 
# 
# 
# 
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# cat("count no of students who got the particular grade\n");
# A=dbSendQuery(conn6,"SELECT count(*) from stud where cpi>9.00")
# x = fetch(A)
# a=x[1,"count(*)"]
# 
# B=dbSendQuery(conn6,"SELECT count(*) from stud where cpi>8.00 and cpi<9.00")
# y = fetch(B)
# b=y[1,"count(*)"]
# 
# C=dbSendQuery(conn6,"SELECT count(*) from stud where cpi>7.00 and cpi<8.00")
# z = fetch(C)
# c=z[1,"count(*)"]
# 
# D=dbSendQuery(conn6,"SELECT count(*) from stud where cpi>5.00 and cpi<7.00")
# w = fetch(D)
# d=w[1,"count(*)"]
# 
# E=dbSendQuery(conn6,"SELECT count(*) from stud where cpi<5.00")
# p = fetch(E)
# e=p[1,"count(*)"]
# 
# cat(a,b,c,d,e,"\n")
# 
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# cat("give those students who recieve distinction in 2nd year")
# A=dbSendQuery(conn7,"SELECT name,ID,cpi from stud where cpi>9.00")
# x = fetch(A)
# print(x);
# 
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# cat("pie chart of grade")
# x<- c(a,b,c,d,e)
# labels<-c("A","B","C","D","E(fail)")
# png(file ="gradesPie.jpg")
# per=round(100*x / sum(x),1)
# pie(x, labels=per, main="grades Distribution",
#     col=rainbow(length(x)))
# legend("topright",c("A","B","C","D","E(fail)"),cex=1,fill =rainbow(length(x)))
# dev.off()
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# 
# # bar chart of grade
# png(file ="gradesBar.jpg")
# per=round(100*x / sum(x),1)
# barplot(x, names.arg = labels, xlab ="Grades", 
#         ylab ="students", col =rainbow(length(x)), 
#         main ="grades Distribution")
# dev.off()
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# 
# #line chart of sem3 and sem4 toppers
# A=dbSendQuery(conn8,"SELECT spi3 from stud where cpi>9.00")
# x = fetch(A)
# sem3=c()
# for (e in x) {
#   sem3=append(sem3,e)
# }
# 
# B=dbSendQuery(conn8,"SELECT spi4 from stud where cpi>9.00")
# y = fetch(B)
# sem4=c()
# for (e in y) {
#   sem4=append(sem4,e)
# }
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 
# 
# 
# 
# # # Plot the line chart.
# png(file ="sppi.png")
# plot(sem3,type = "o",col = "red", xlab = "students", ylab = "spi",
#      main = "Event count chart")
# lines(sem4, type = "o", col = "blue")
# # Add a legend
# legend("topleft", legend=c("spi3", "spi4"),
#        col=c("red", "blue"), lty=1:2, cex=0.8,
#        title="Line types", text.font=4, bg='lightblue')
# 
# dev.off()
# 
# 
# 
# 
# cat("\n-----------------------------------------------------\n\n")
# 
# 








