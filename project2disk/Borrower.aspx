<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" MasterPageFile="~/site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceholder" runat="server" >
    <br />
    <br />
  
        <div class="form-group">

            <label class="col-sm-3 control-label">First Name</label>

            <div class="col-sm-4">
                <asp:TextBox ID="tbFName" runat="server" CssClass="form-control"></asp:TextBox> 
                <!-- may need TextMode-->
            </div>

            <!-- first name validation -->
            <div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvFName" runat="server" 
                    ControlToValidate="tbFName" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvFName" runat="server" Text="Must be a name." CssClass="text-danger"
                    Display="Dynamic" ControlToValidate="tbFName" Type="string" Operator="DataTypeCheck">
                </asp:CompareValidator>
            </div>


            <label class="col-sm-3 control-label">Last Name</label>

            <div class="col-sm-4">
                <asp:TextBox ID="tbLName" runat="server" CssClass="form-control"></asp:TextBox> 
                <!-- may need TextMode-->
            </div>

            <!-- last name validation -->
            <div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvLName" runat="server" 
                    ControlToValidate="tbLName" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvLName" runat="server" Text="Must be a name." CssClass="text-danger"
                    Display="Dynamic" ControlToValidate="tbLName" Type="string" Operator="DataTypeCheck">
                </asp:CompareValidator>
            </div>


            <label class="col-sm-3 control-label">Phone Number</label>

            <div class="col-sm-4">
                <asp:TextBox ID="tbPhone" runat="server" CssClass="form-control"></asp:TextBox> 
                <!-- may need TextMode-->
            </div>

            <!-- phone number validation -->
            <div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                    ControlToValidate="tbPhone" text="*" CssClass="text-danger" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Please enter a phone number (###-###-####)." CssClass="text-danger" Display="Dynamic" ControlToValidate="tbPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                </asp:RegularExpressionValidator>
            </div>

            <asp:Button ID="Button1" class="submitButton" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>
        
    <%-- message label --%>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-11">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div>

</asp:Content>
