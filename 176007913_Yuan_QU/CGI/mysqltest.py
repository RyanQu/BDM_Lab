#Date: 2017.03.26
#Author: Ryan Qu
#Version: 1.0
#Description: The function to connect MySQL.
#Encoding: UTF-8

import MySQLdb

def connect_mysql(hostname,username,password,charset,db_name,sql):
    try:
        conn=MySQLdb.Connect(host='%s'%hostname,user='%s'%username,passwd='%s'%password,port=3306,charset='%s'%charset,db='%s'%db_name)
        cur=conn.cursor()
        
        cur.execute(sql)

        results = cur.fetchall()
        attribute = cur.description
        result_set=[]
        for row in results:
            result_row=[]
            for column in row:
                result_row.append(column)
            result_set.append(result_row) 

        attribute_list=[]
        for item in attribute:
            attribute_list.append(item[0])

    except:
        result_set=[]
        attribute_list=[]

    conn.close()
    return result_set, attribute_list