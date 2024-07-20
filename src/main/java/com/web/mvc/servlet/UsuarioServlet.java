package com.web.mvc.servlet;

import com.web.mvc.entity.Role;
import com.web.mvc.entity.Usuario;
import com.web.mvc.entity.Tag;
import com.web.mvc.persistence.CrudRepository;
import com.web.mvc.persistence.GenericRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Optional;
import java.util.Set;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    private final CrudRepository<Usuario, Integer> usuarioDao = new GenericRepository<>(Usuario.class);
    private final CrudRepository<Role, Integer> roleDao = new GenericRepository<>(Role.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Integer id = Integer.parseInt(req.getParameter("id"));

        switch (action) {
            case "delete" :
                try {
                    usuarioDao.deleteById(id);
                } catch (Exception e){
                    req.setAttribute("err_msg", "No es posible eliminar este usuario porque está asociada a elementos activos. Por favor, reasigne estos elementos antes de intentar nuevamente.");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;

            case "save":
                String nombre = req.getParameter("nombre");
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                Integer role = Integer.parseInt(req.getParameter("role"));
                Usuario producto = new Usuario(id, nombre, email, password, new Role(role));
                usuarioDao.save(producto);
                break;

            default:
                req.setAttribute("err_msg", "La accion no se encuentra especificada");
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        resp.sendRedirect(req.getContextPath().concat("/usuario"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameParam = req.getParameter("name");
        String idParam = req.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            if (id == 0){
                Usuario usuario = new Usuario(0);
                req.setAttribute("roles", roleDao.findAll());
                req.setAttribute("item", usuario);
                req.getRequestDispatcher("/view/usuario/form.jsp").forward(req, resp);
            } else {
                Optional<Usuario> usuario = usuarioDao.findById(id);
                if (usuario.isPresent()) {
                    req.setAttribute("roles", roleDao.findAll());
                    req.setAttribute("item", usuario.get());
                    req.getRequestDispatcher("/view/usuario/form.jsp").forward(req, resp);
                } else {
                    req.setAttribute("err_msg", "El usuario no se encuentra registrado");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } else {
            if (nameParam != null && !nameParam.isEmpty()) {
                req.setAttribute("name", nameParam);
                req.setAttribute("items", usuarioDao.findAllName(nameParam));
            } else {
                req.setAttribute("name", "");
                req.setAttribute("items", usuarioDao.findAll());
            }
            req.getRequestDispatcher("/view/usuario/index.jsp").forward(req, resp);
        }
    }
}
