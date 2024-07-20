package com.web.mvc.servlet;

import com.web.mvc.entity.Categoria;
import com.web.mvc.entity.Producto;
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

@WebServlet("/producto")
public class ProductoServlet extends HttpServlet {

    private final CrudRepository<Producto, Integer> productoDao = new GenericRepository<>(Producto.class);
    private final CrudRepository<Categoria, Integer> categoriaDao = new GenericRepository<>(Categoria.class);
    private final CrudRepository<Tag, Integer> tagDao = new GenericRepository<>(Tag.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Integer id = Integer.parseInt(req.getParameter("id"));

        switch (action) {
            case "delete" :
                productoDao.deleteById(id);
                break;

            case "save":
                String nombre = req.getParameter("nombre");
                String descripcion = req.getParameter("descripcion");
                String precio = req.getParameter("precio");
                String stock = req.getParameter("stock");
                Integer category = Integer.parseInt(req.getParameter("category"));
                String[] tags = req.getParameterValues("tag");
                Set<Tag> tagSet = new LinkedHashSet<>();
                for (String tag : tags){
                    Tag tg = new Tag(Integer.parseInt(tag));
                    tagSet.add(tg);
                }
                Producto producto = new Producto(id, nombre, descripcion, new BigDecimal(precio), Integer.valueOf(stock), new Categoria(category), tagSet);
                productoDao.save(producto);
                break;

            default:
                req.setAttribute("err_msg", "La accion no se encuentra especificada");
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        resp.sendRedirect(req.getContextPath().concat("/producto"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameParam = req.getParameter("name");
        String idParam = req.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            if (id == 0){
                Producto cliente = new Producto(0);
                req.setAttribute("categorias", categoriaDao.findAll());
                req.setAttribute("tags", tagDao.findAll());
                req.setAttribute("item", cliente);
                req.getRequestDispatcher("/view/producto/form.jsp").forward(req, resp);
            } else {
                Optional<Producto> cliente = productoDao.findById(id);
                if (cliente.isPresent()) {
                    req.setAttribute("categorias", categoriaDao.findAll());
                    req.setAttribute("tags", tagDao.findAll());
                    req.setAttribute("item", cliente.get());
                    req.getRequestDispatcher("/view/producto/form.jsp").forward(req, resp);
                } else {
                    req.setAttribute("err_msg", "El producto no se encuentra registrado");
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } else {
            if (nameParam != null && !nameParam.isEmpty()) {
                req.setAttribute("name", nameParam);
                req.setAttribute("items", productoDao.findAllName(nameParam));
            } else {
                req.setAttribute("name", "");
                req.setAttribute("items", productoDao.findAll());
            }
            req.getRequestDispatcher("/view/producto/index.jsp").forward(req, resp);
        }
    }
}
