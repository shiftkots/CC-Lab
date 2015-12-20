<?php
/**
 * Initial Index/Landing Page
 *
 * A basic login page.
 *
 * PHP version 5.3.28
 *
 * @category Web_App
 * @package  Web_App
 * @author   Roy A Vanegas <roy@thecodeeducators.com>
 * @license  https://gnu.org/licenses/gpl.html GNU General Public License
 * @link     https://bitbucket.org/code-warrior/web-app/
 */

session_start();

if (isset($_SESSION["valid"])) {
    if (1 == $_SESSION["valid"]) {
        header("Location: home.php");
    }
}

if (!isset($_GET['action'])) {
    $_GET['action'] = "register";
    header("Location: ./index.php?action=". $_GET['action']);
}

require "includes/main.php";

if (isset($_GET['action'])) {
    if ("login" == $_GET['action']) {
        $action_value = "login.php";
        $subheading = $button_value = "login";
    } else {
        if ("register" == $_GET['action']) {
            $action_value = "register.php";
            $subheading = $button_value = "register";
        }
    }
}
?>
<!DOCTYPE HTML>
<html>
   <head>
      <meta charset="utf-8">
      <title>HAPPY_CITY</title>
      <link rel="stylesheet" href="css/inStyle.css">
      <link rel="stylesheet"
            href="css/style.css">
   </head>
   <body>
      <header>
      <div class="choose">
      <p><a href="./index.php?action=register">register</a> / <a href="./index.php?action=login">login</a></p>
      </div>
         <div class="logo">
             <img src="images/logo2.gif" width="1000"/>
         </div>
      </header>
      <form action="<?php echo $action_value; ?>" method="post" class="loreg">
         <p><input class="usn"
         type="text"
                   name="username"
                   placeholder="username"
                   required
                   autofocus></p>
         <p><input class="psw"
         type="password"
                   name="password"
                   placeholder="password" required></p>
         <p><input type="hidden" name="submitted" value="1"></p>
         <div class="solo">
          <p><input class="button" type="submit" value="<?php echo $button_value; ?>"></p>
         </div>
      </form>
   </body>
</html>
