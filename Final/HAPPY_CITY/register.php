<?php
/**
 * Handles the registration process: Registers and verifies the acceptance of a new
 * user, or redirects her/him back to the registration page if an error occurs.
 *
 * TODO: handle the error situations in the else clauses.
 *
 * PHP version 5.3.28
 *
 * @category Web_App
 * @package  Web_App
 * @author   Roy Vanegas <roy@thecodeeducators.com>
 * @license  https://gnu.org/licenses/gpl.html GNU General Public License
 * @link     https://bitbucket.org/code-warrior/web-app/
 */

require_once "includes/main.php";

// If the variable “submitted” was sent in the form,
if (isset($_POST["submitted"])) {
    // and, it’s equal to 1, meaning that it was actually submitted,
    if (1 == $_POST["submitted"]) {
        // and, every variable that is part of the form was actually received by
        // this file, meaning that the form was not hi- or side-jacked,
        if (whiteList()) {
            // and, both the username and password contain at least one character
            // (this is a redundancy check, since each form variable is marked
            // as “required” in the HTML form),
            if (2 < strlen($_POST['username']) && 7 < strlen($_POST['password'])) {
                // then process the username and password.

                // 1. Remove whitespace surrounding the username.
                // 2. Convert <, >, ', and " to their respective HTML entities
                // 3. Handle HTML5 code
                // 4. Use the UTF-8 character set
                $username = htmlentities(
                    trim($_POST['username']), ENT_QUOTES | 'ENT_HTML5', "UTF-8"
                );

                $password = trim($_POST['password']);

                if (!doesUserExist($username)) {

                    registerNewUser($username, $password);

                    include_once "includes/register_success.inc";

                    header("Refresh: 5; ./index.php?action=login");
                } else {
                    header("Location: error.php?message_type=registration_error");
                }
            }
        }
    }
}
