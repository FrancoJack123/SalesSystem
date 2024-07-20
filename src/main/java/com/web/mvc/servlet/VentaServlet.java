package com.web.mvc.servlet;

import com.web.mvc.entity.Categoria;
import com.web.mvc.entity.Venta;
import com.web.mvc.persistence.CrudRepository;
import com.web.mvc.persistence.GenericRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/venta")
public class VentaServlet extends HttpServlet {
    private final CrudRepository<Venta, Integer> ventaDao = new GenericRepository<>(Venta.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Integer id = Integer.parseInt(req.getParameter("id"));

        switch (action) {
            case "delete" :
                try {
                    ventaDao.deleteById(id);
                } catch (Exception e){
                    req.setAttribute("err_msg", "No es posible eliminar esta venta porque está asociada a elementos activos. Por favor, reasigne estos elementos antes de intentar nuevamente.");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;

            case "save":
                String nombre = req.getParameter("nombre");

                Categoria cliente = new Categoria(id, nombre);
                //ventaDao.save(cliente);
                break;

            default:
                req.setAttribute("err_msg", "La accion no se encuentra especificada");
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        resp.sendRedirect(req.getContextPath().concat("/categoria"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String nameParam = req.getParameter("name");
//        String idParam = req.getParameter("id");
//        if (idParam != null && !idParam.isEmpty()) {
//            int id = Integer.parseInt(idParam);
//            if (id == 0){
//                Categoria cliente = new Categoria(0);
//                req.setAttribute("item", cliente);
//                req.getRequestDispatcher("/view/categoria/form.jsp").forward(req, resp);
//            } else {
//                Optional<Venta> cliente = ventaDao.findById(id);
//                if (cliente.isPresent()) {
//                    req.setAttribute("item", cliente.get());
//                    req.getRequestDispatcher("/view/categoria/form.jsp").forward(req, resp);
//                } else {
//                    req.setAttribute("err_msg", "La categoria no se encuentra registrada");
//                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
//                }
//            }
//        } else {
//            if (nameParam != null && !nameParam.isEmpty()) {
//                req.setAttribute("name", nameParam);
//                req.setAttribute("items", ventaDao.findAllName(nameParam));
//            } else {
//                req.setAttribute("name", "");
//                req.setAttribute("items", ventaDao.findAllName(""));
//            }
//            req.getRequestDispatcher("/view/categoria/index.jsp").forward(req, resp);
//        }resp
        req.getRequestDispatcher("/view/venta/form.jsp").forward(req, resp);
    }
}
