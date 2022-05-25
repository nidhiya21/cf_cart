<cflock scope="session" type="exclusive" timeout="5">

<cfparam name="session.cart" default="#ArrayNew(1)#">

<cfset sItem = StructNew()>

<cfset sItem.product_id = url.product_id>
<cfset sItem.product = url.product_name>
<cfset sItem.price = url.price>
<cfset sItem.quantity = url.quantity>

<cfset ArrayAppend(session.cart, sItem)>

</cflock>
<table class="cart" cellspacing="0" style="margin-top: 2em;">
<thead>
<tr>
  <th>Product</th>
  <th>Unit Price</th>
  <th>Quantity</th>
  <th>Total</th>
</tr>
</thead>
<cflock scope="session" type="readonly" timeout="5">

<cfparam name="session.cart" default="#ArrayNew(1)#">
<cfset cartSize = ArrayLen(session.cart)>
<cfset total = 0>
<cfloop index="i" from="1" to="#cartSize#">
<tr>
  <td>
    #session.cart[i].product#
  </td>
  <td style="text-align: right;">
    #NumberFormat(session.cart[i].price, "$9.99")#
  </td>
  <td style="text-align: center;">#session.cart[i].quantity#</td>
  <td><cfset itemTotal = session.cart[i].quantity * itemPrice>#NumberFormat(itemTotal, "$9.99")#</td>
  <cfset total = total + itemTotal>
</tr>
</cfloop>
</cflock>
<tr>
  <td colspan="2" style="border: 0;"></td>
  <td style="border-left: 1px solid ##aaa; text-align: right;">Total</td>
  <td style="font-weight: bold; border-left: 0;">#NumberFormat(total, "$9.99")#</td>
  <td style="border-left: 0;">&nbsp;</td>
</tr>
</table>