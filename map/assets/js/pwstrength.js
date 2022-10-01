 function CheckPasswordStrength(password) {
        var password_strength = document.getElementById("password_strength");
 
        if (password.length == 0) {
            password_strength.innerHTML = "";
            document.getElementById('fpwd1').classList.remove('has-error');
            document.getElementById('fpwd1').classList.remove('has-success');
            return;
        }
 
        var regex = new Array();
        regex.push("[A-Z]"); //Uppercase Alphabet.
        regex.push("[a-z]"); //Lowercase Alphabet.
        regex.push("[0-9]"); //Digit.
        regex.push("[$@$!%*#?&]"); //Special Character.
 
        var passed = 0;
 
        //Validate for each Regular Expression.
        for (var i = 0; i < regex.length; i++) {
            if (new RegExp(regex[i]).test(password)) {
                passed++;
            }
        }
 
        //Validate for length of Password.
        if (passed > 2 && password.length > 8) {
            passed++;
        }

        var color = "";
        var strength = "";
        switch (passed) {
            case 0:
            case 1:
                strength = "Password Strength : Weak ";
                color = "red";
                document.getElementById("Register").disabled = true;   
                break;
            case 2:
                strength = "Password Strength : Good";
                color = "green"; 
                break;
            case 3:
            case 4:
                strength = "Password Strength : Strong";
                color = "green";
                break;
            case 5:
                strength = "Password Strength : Very Strong";
                color = "darkgreen";
                break;
        }

        password_strength.innerHTML = strength;
        password_strength.style.color = color;


        if (password_strength.innerHTML   == "Password Strength : Weak ") {
              document.getElementById('fpwd1').classList.add('has-error');
        }else{
              document.getElementById('fpwd1').classList.add('has-success');
        }

    }

function checkPass()
{
  
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('password2');
 
    var message = document.getElementById('confirmMessage');

     document.getElementById('fpwd2').classList.remove('has-error');
     document.getElementById('fpwd2').classList.remove('has-success');

     if(pass1.value  != 0){ 
    
                if(pass1.value == pass2.value){
                   
                    message.style.color = "green";
                    message.innerHTML = "Passwords Match!"
                    document.getElementById("Register").disabled = false;
                    document.getElementById('fpwd2').classList.add('has-success');
                }else{
                    
                    message.style.color = "red";
                    message.innerHTML = "Passwords Do Not Match!"
                    document.getElementById("Register").disabled = true;
                     document.getElementById('fpwd2').classList.add('has-error');

                }

        } else{

           message.innerHTML = "";
           
        }       
}