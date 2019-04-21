function postData(){

    async function main() {

        const MWBot = require('mwbot');

        const botUserName = 'Verena@editbot'
        const botPassword = 'nq78aakp00ng9811cid7cdcs4a7a8hps'
        const baseUrl = 'http://localhost'
        const bot = new MWBot({
            apiUrl: 'http://localhost/smw/api.php'
        });
        await bot.loginGetEditToken({
            username: botUserName,
            password: botPassword
        }).catch((err) => {
            // eslint-disable-next-line no-console
            console.warn(err);
        });


        bot.edit(`User:${botUserName}/sandbox/HelloWorld`, 
            `Hello World! Congrats, you have created a bot edit. Now head to [[WP:Bots]] to find information on how to get your bot approved and running!`, 
            `Edit from a bot called [[User:${botUserName}]] built with #mwbot`).then((response) => {
            // eslint-disable-next-line no-console
            console.log(`Success`, response);
            // eslint-disable-next-line no-console
            console.log(`Now visit on your browser to see your edit:
            ${baseUrl}/wiki/User:${botUserName}/sandbox/HelloWorld`);
        }).catch((err) => {
            // eslint-disable-next-line no-console
            console.warn(err);
        });
    }
    // In the root scope of a script, you must use the promise notation, as await is not allowed there.
    // eslint-disable-next-line no-console
    main().catch(console.error);
}
//postData();
export {postData}
