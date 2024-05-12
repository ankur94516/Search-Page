<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="Kit_Interview_02.SearchPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Search Page</title>
    <link rel="stylesheet" type="text/css"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body style="padding-top: 10px; padding-left: 10px;">
    <div class="col-xs-8 col-xs-offset-2">
        <form id="form1" runat="server" class="form-horizontal" onsubmit="return validateForm()">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Product Search Form</h3>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label for="inputProductName" class="control-label col-xs-2">
                            Product Name
                        </label>
                        <div class="col-xs-4">
                            <input type="text" runat="server" class="form-control"
                                id="inputProductName" placeholder="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputSize" class="control-label col-xs-2">
                            Size
                        </label>
                        <div class="col-xs-4">
                            <input type="text" runat="server" class="form-control"
                                id="inputSize" placeholder="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPrice" class="control-label col-xs-2">
                            Price
                        </label>
                        <div class="col-xs-4">
                            <input type="text" runat="server" class="form-control"
                                id="inputPrice" placeholder="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputMfgDate" class="control-label col-xs-2">
                            Mfg Date
                        </label>
                        <div class="col-xs-4">
                            <input type="date" runat="server" class="form-control"
                                id="inputMfgDate" placeholder="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputCategory" class="control-label col-xs-2">
                            Category
                        </label>
                        <div class="col-xs-4">
                            <input type="text" runat="server" class="form-control"
                                id="inputCategory" placeholder="" />
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="ddlConjunction" class="control-label col-xs-2">
                            Conjunction
                        </label>
                        <div class="col-xs-4">
                            <select runat="server" id="ddlConjunction" class="form-control">
                                <option value="AND">AND</option>
                                <option value="OR">OR</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-8 col-xs-offset-2">
                            <asp:Button ID="btnSearch" runat="server" Text="Search"
                                CssClass="btn btn-primary" OnClick="btnSearch_Click" />

                            <asp:Button ID="btnClear" runat="server" Text="Clear"
                                CssClass="btn btn-primary" OnClick="btnClear_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Search Results</h3>
                </div>
                <div class="panel-body">
                    <div class="col-xs-10">
                        <asp:GridView CssClass="table table-bordered"
                            ID="gvSearchResults" runat="server">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        // function to validate the form
        function validateForm() {
            var productName = document.getElementById('inputProductName').value;
            var size = document.getElementById('inputSize').value;

            var price = document.getElementById('inputPrice').value;

            if (price != "") {
                if (isNaN(parseFloat(price))) {
                    alert('Price must be a valid number.');
                    return false; // Prevent form submission
                }
            }


            var mfgDate = document.getElementById('inputMfgDate').value;
            var category = document.getElementById('inputCategory').value;

            if (productName === '' && size === '' && price === '' && mfgDate === '' && category === '') {
                alert('Please fill in at least one search criteria.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
