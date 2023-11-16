package com.ltweb.auctionapp.controller;

import com.ltweb.auctionapp.model.AuctionItem;
import com.ltweb.auctionapp.model.User;
import com.ltweb.auctionapp.service.AuctionService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "bid-action", value = "/bid-action")
public class BidAction extends HttpServlet {
    private AuctionService auctionService = new AuctionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        Long id = Long.valueOf(request.getParameter("id"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        AuctionItem auctionItem = auctionService.getAuctionItem(id);
        if (amount >= auctionItem.getCurrentPrice() + auctionItem.getPriceStep()) {
            auctionService.bid(user, auctionItem, amount);
            response.sendRedirect("list-items");
        }

    }
}
