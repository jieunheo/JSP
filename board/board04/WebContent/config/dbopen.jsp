<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%@ page import="ezen.*" %>
<%
//업로드 할 폴더 경로
String uploadPath = "C:\\hje\\WorkSpace\\Board04\\WebContent\\upload";

//DB 열기
DBManager dbms = new DBManager();
dbms.DBOpen();
%>