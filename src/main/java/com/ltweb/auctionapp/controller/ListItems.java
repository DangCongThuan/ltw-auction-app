package com.ltweb.auctionapp.controller;

import com.ltweb.auctionapp.model.AuctionItem;
import com.ltweb.auctionapp.service.AuctionService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "list-items", value = "/list-items")
public class ListItems extends HttpServlet {
    private AuctionService auctionService = new AuctionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<AuctionItem> listItems = auctionService.getAllAuctionItems();
        request.setAttribute("listItems", listItems);
        request.getRequestDispatcher("listItems.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
