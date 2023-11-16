package com.ltweb.auctionapp.controller;

import com.ltweb.auctionapp.model.AuctionItem;
import com.ltweb.auctionapp.service.AuctionService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "show-topic", value = "/show-topic")
public class ShowTopic extends HttpServlet {
    private AuctionService auctionService = new AuctionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        if (id != null) {
            AuctionItem item = auctionService.getAuctionItem(id);
            request.setAttribute("item", item);
            request.getRequestDispatcher("showTopic.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
