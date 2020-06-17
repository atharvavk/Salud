<%@ page import="java.util.Random" %>
<%@ page import="Model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<c:if test="${empty User}">
    <c:redirect url="../login.jsp"/>
</c:if>
<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
        <ul class="nav navbar-nav flex-nowrap ml-auto">
            <div class="d-none d-sm-block topbar-divider"></div>
            <li class="nav-item dropdown no-arrow" role="presentation">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">${User.name}</span>
                        </a>
                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
                        <a class="dropdown-item" role="presentation" href="profile.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a>
                        <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Change Password</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" role="presentation" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>