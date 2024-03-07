package com.bean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

@WebServlet(name = "UploadImageServlet", value = "/UploadImageServlet")
@MultipartConfig(maxFileSize = 16177215) // 最大文件大小设置为 16MB
public class UploadImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

}
