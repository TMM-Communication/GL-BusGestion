<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="GL_BusGestion.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        jQuery(document).ready(function () {

            $("#formAddVisit").dialog({
                autoOpen: false,
                height: 400,
                width: 351,
                modal: true,
                buttons: {
                    "Create an account": addUser,
                    Cancel: function () {
                        dialog.dialog("close");
                    }
                },
                close: function () {
                    form[0].reset();
                    allFields.removeClass("ui-state-error");
                }
            });

            $("#btnAddVisit").button().on("click", function () {
                dialog.dialog("open");
            });

            function addUser() {
                var valid = true;
                allFields.removeClass("ui-state-error");

                valid = valid && checkLength(name, "username", 3, 16);
                valid = valid && checkLength(email, "email", 6, 80);
                valid = valid && checkLength(password, "password", 5, 16);

                valid = valid && checkRegexp(name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter.");
                valid = valid && checkRegexp(email, emailRegex, "eg. ui@jquery.com");
                valid = valid && checkRegexp(password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9");

                if (valid) {
                    $("#users tbody").append("<tr>" +
                        "<td>" + name.val() + "</td>" +
                        "<td>" + email.val() + "</td>" +
                        "<td>" + password.val() + "</td>" +
                        "</tr>");
                    dialog.dialog("close");
                }
                return valid;
            }
        });
    </script>
    <div>
        <button id="btnAddVisit" class="btn">Ajouter une visite</button>
    </div>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <div id="formAddVisit" title="Ajouter une nouvelle visite">
      <p class="validateTips">Tous les champs sont requis</p>
 
      <form>
        <fieldset>
          <label for="name">Name</label>
          <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
          <label for="email">Email</label>
          <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
          <label for="password">Password</label>
          <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
 
          <!-- Allow form submission with keyboard without duplicating the dialog button -->
          <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
        </fieldset>
      </form>
    </div>

</asp:Content>
