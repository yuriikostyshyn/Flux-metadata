<%@ include file="homepageTop.jsp"%><div class="main-content-div transactions-page-content" >	<div style="height:600px;  overflow: auto;">		<table  style="width:100%;text-align: center;">			<thead>				<tr>				<th></th>				<th>Sender account number</th>				<th>Receiver account number</th>				<th>Start Date</th>				</tr>			</thead>		 	<c:forEach var="transaction" items="${transactions}">		 		<tr>		 		<td>		 		<input type="image" id="image${transaction.transactionId}" src="layout/images/extend_button.png" onclick="extendTransaction('row${transaction.transactionId}','image${transaction.transactionId}')"/>		 		</td>		 			<td>${transaction.accountFrom.accountId}</td>		 			<td>${transaction.accountTo.accountId}</td>		 			<td>${transaction.startDate}</td>		 		</tr>		 		<tr style="visibility: collapse;" id="row${transaction.transactionId}">		 		<td></td>			 		<td>				 		<div class="transaction-extension">				 			Money Amount: ${transaction.amount}<br/>				 			EndDate: ${transaction.endDate}<br/>				 			Status: ${transaction.status.statusMessage}<br/>						</div>			 		</td>			 		</tr>		 	</c:forEach>		</table>	</div><%@ include file="homepageBottom.jsp"%>