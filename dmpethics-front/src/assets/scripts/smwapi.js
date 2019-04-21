//import axios from 'axios';

function postData() {
  const MWBot = require('mwbot');
  let bot = new MWBot();
  bot.loginGetEditToken({
      apiUrl: "http://localhost:80/smw/api.php",
      username: "verena",
      password: "schmendrick"
  }).then(() => {
      return bot.read('Main Page');
  }).then((response) => {
      // eslint-disable-next-line no-console
      console.log(response);
  }).catch((err) => {
      // eslint-disable-next-line no-console
      console.log(err);
  });

  /*axios
  .get('http://localhost/smw/api.php?action=query&meta=tokens&type=login&format=json&origin=http://localhost:4000')
  .then(response => {
    var token = response.data.query.tokens.logintoken;
    var cookie = response.headers.cookie;

    return (
      axios
      .post('http://localhost/smw/api.php', {body:{"action":"login", "format":"json", "origin":"http://localhost:4000", "lgname":"verena", "lgpassword":"schmendrick", "lgtoken":token}}, {headers:{"Cookie":cookie}})
    );
  })
*/}
export {postData}
// eslint-disable-next-line no-unused-vars
function start(){
var request = require("request"),
	cookie = request.cookie('MC_STORE_ID=66860');

// eslint-disable-next-line no-unused-vars
request('http://localhost/smw/api.php?action=query&format=json&meta=tokens&type=login', function (error, response, body) {
  var token = body.data.query.tokens.logintoken;
  cookie = response.headers['set-cookie'];

	var options = {
    url: 'http://localhost/smw/api.php',
    method: 'POST',
    headers: {
      'content-type' : 'application/x-www-form-urlencoded',
      'Cookie': cookie
    },
    form: {
      'lgname': 'verena',
      'lgpassword': 'schmendrick', //https://www.mediawiki.org/wiki/Manual:Bot_passwords
      'lgtoken': token,
      'action' : 'login',
      'format' : 'json'
		}
	}
  // eslint-disable-next-line no-unused-vars
  request(options, function(error, response, body){
  cookie = response.headers['set-cookie'];
    //getEditToken(cookie);
  });	
});

}
/*
var getEditToken = function(cukie) {
	var options = {
    url: 'http://localhost/smw/api.php?format=json&action=query&meta=tokens',
    method: 'GET',
    headers: {
      'Cookie': cukie
    }
	}

	request(options, 
		function (error, response, body) {
      var token = JSON.parse(body).query.tokens.csrftoken;
      cookie = response.headers['set-cookie'];		  	
      
      if(token && cookie) {
        makeAnEdit(token, cookie);
      }
	});
}

var makeAnEdit = function(token, cukie) {
	var options = {
    url: 'http://localhost/smw/api.php',
    method: 'POST',
    headers: {
      'Cookie': cukie
    },
    form: {
      'action' : 'edit',
      'format' : 'json',
      'title': "Studytitle",
      'text': "test",
      'summary': "",
      'token': token,
		}
	}

	request(options, 
		function (error, response, body) {
			if(error) {
				// eslint-disable-next-line no-console
				console.log(error);
			} else {
				// eslint-disable-next-line no-console
				console.log(response + body);
			}
	});
}}*/