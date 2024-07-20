package com.web.mvc.servlet;

import com.web.mvc.entity.Role;
import com.web.mvc.persistence.CrudRepository;
import com.web.mvc.persistence.GenericRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/rol")
public class RolServlet extends HttpServlet {
    private final CrudRepository<Role, Integer> roleDao = new GenericRepository<>(Role.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Integer id = Integer.parseInt(req.getParameter("id"));

        switch (action) {
            case "delete" :
                try {
                    roleDao.deleteById(id);
                } catch (Exception e){
                    req.setAttribute("err_msg", "No es posible eliminar este rol porque está asociada a elementos activos. Por favor, reasigne estos elementos antes de intentar nuevamente.");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;

            case "save":
                String nombre = req.getParameter("nombre");

                Role cliente = new Role(id, nombre);
                roleDao.save(cliente);
                break;

            default:
                req.setAttribute("err_msg", "La accion no se encuentra especificada");
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        resp.sendRedirect(req.getContextPath().concat("/rol"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameParam = req.getParameter("name");
        String idParam = req.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            if (id == 0){
                Role cliente = new Role(0);
                req.setAttribute("item", cliente);
                req.getRequestDispatcher("/view/rol/form.jsp").forward(req, resp);
            } else {
                Optional<Role> cliente = roleDao.findById(id);
                if (cliente.isPresent()) {
                    req.setAttribute("item", cliente.get());
                    req.getRequestDispatcher("/view/rol/form.jsp").forward(req, resp);
                } else {
                    req.setAttribute("err_msg", "El rol no se encuentra registrado");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } else {
            if (nameParam != null && !nameParam.isEmpty()) {
                req.setAttribute("name", nameParam);
                req.setAttribute("items", roleDao.findAllName(nameParam));
            } else {
                req.setAttribute("name", "");
                req.setAttribute("items", roleDao.findAllName(""));
            }
            req.getRequestDispatcher("/view/rol/index.jsp").forward(req, resp);
        }
    }
}
