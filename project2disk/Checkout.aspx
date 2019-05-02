<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" MasterPageFile="~/site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceholder" runat="server" >

        Check Out a Disk to a Borrower:<br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="fname" DataValueField="borrower_id">
    </asp:DropDownList>
    
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="disk_name" DataValueField="disk_id">
    </asp:DropDownList>

        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" CssClass="containercenter">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>

    <asp:Button ID="Button1" runat="server" Text="Check Out"  OnClick="Button1_Click" />

    <asp:Label ID="lblCheckout" runat="server" Text=""></asp:Label>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT [fname], [lname], [borrower_id] FROM [borrower] ORDER BY [fname], [lname]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT [disk_name], [status_id], [disk_id] FROM [disk] WHERE ([status_id] = @status_id) ORDER BY [disk_name]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="status_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

        <br />

        <!-- attempt to center the listview -->
        <table width="100%">
           <tr>
             <td align="center">
               <table>
                 <tr>
                    <td>


        <asp:ListView ID="ListView1" runat="server" DataKeyNames="disk_id,borrower_id,borrowed_date" DataSourceID="SqlDataSource1" class="containercenter">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel1" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="returned_dateTextBox" runat="server" Text='<%# Bind("returned_date") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="disk_idTextBox" runat="server" Text='<%# Bind("disk_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="borrower_idTextBox" runat="server" Text='<%# Bind("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="borrowed_dateTextBox" runat="server" Text='<%# Bind("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="returned_dateTextBox" runat="server" Text='<%# Bind("returned_date") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">Disk ID</th>
                                    <th runat="server">Borrower ID</th>
                                    <th runat="server">Borrowed Date</th>
                                    <th runat="server">Retured Date</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

                    </td>
                     </tr>
               </table>
             </td>
           </tr>
        </table>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT * FROM [diskHasBorrower] ORDER BY [disk_id]"></asp:SqlDataSource>

    <%@ Import Namespace="System.Data.SqlClient" %>
    <script runat="server">
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Code that uses the data entered by the user
                // Define data objects
                SqlConnection conn;
                SqlCommand comm;
                //Read the connection string from Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["disk_inv_cc_login"].ConnectionString;

                // Initialize connection
                conn = new SqlConnection(connectionString);
                // Create command 
                comm = new SqlCommand("EXEC sp_ins_borrower @borrower_id, @disk_id, @borrowed_date", conn);
                comm.Parameters.Add("@borrower_id", System.Data.SqlDbType.Int);
                comm.Parameters["@borrower_id"].Value = DropDownList1.SelectedValue;
                comm.Parameters.Add("@disk_id", System.Data.SqlDbType.Int);
                comm.Parameters["@disk_id"].Value = DropDownList2.SelectedValue;
                comm.Parameters.Add("@borrowed_date", System.Data.SqlDbType.DateTime);
                comm.Parameters["@borrowed_date"].Value = Calendar1.SelectedDate;

                // Enclose database code in Try-Catch-Finally
                try
                {
                    // Open the connection
                    conn.Open();
                    // Execute the command
                    comm.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    // Display error message
                    lblCheckout.Text = "Error submitting the data!" + ex.Message.ToString();

                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }
        }
    </script>

</asp:Content>
