package com.web.mvc.servlet;

import com.web.mvc.entity.Cliente;
import com.web.mvc.persistence.CrudRepository;
import com.web.mvc.persistence.GenericRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/cliente")
public class ClienteServlet extends HttpServlet {

    private final CrudRepository<Cliente, Integer> clienteDao = new GenericRepository<>(Cliente.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Integer id = Integer.parseInt(req.getParameter("id"));

        switch (action) {
            case "delete" :
                clienteDao.deleteById(id);
                break;

            case "save":
                String nombre = req.getParameter("nombre");
                String dni = req.getParameter("dni");
                String email = req.getParameter("email");
                String telefono = req.getParameter("telefono");
                String direccion = req.getParameter("direccion");

                Cliente cliente = new Cliente(id, nombre, dni, email, telefono, direccion);
                clienteDao.save(cliente);
                break;

            default:
                req.setAttribute("err_msg", "La accion no se encuentra especificada");
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        resp.sendRedirect(req.getContextPath().concat("/cliente"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameParam = req.getParameter("name");
        String idParam = req.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            if (id == 0){
                Cliente cliente = new Cliente(0);
                req.setAttribute("item", cliente);
                req.getRequestDispatcher("/view/cliente/form.jsp").forward(req, resp);
            } else {
                Optional<Cliente> cliente = clienteDao.findById(id);
                if (cliente.isPresent()) {
                    req.setAttribute("item", cliente.get());
                    req.getRequestDispatcher("/view/cliente/form.jsp").forward(req, resp);
                } else {
                    req.setAttribute("err_msg", "El cliente no se encuentra registrado");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } else {
            if (nameParam != null && !nameParam.isEmpty()) {
                req.setAttribute("name", nameParam);
                req.setAttribute("items", clienteDao.findAllName(nameParam));
            } else {
                req.setAttribute("name", "");
                req.setAttribute("items", clienteDao.findAll());
            }
            req.getRequestDispatcher("/view/cliente/index.jsp").forward(req, resp);
        }
    }
}
