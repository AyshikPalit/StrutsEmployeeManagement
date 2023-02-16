<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<option value="">Select a State</option>
<c:forEach var="state" items="${StateList}">
    <option value='${state.getStateCode()}' <c:if test="${state.getStateCode() == User.getStateCode()}"> Selected </c:if>>
        ${state.getStateName()}
    </option>
</c:forEach>