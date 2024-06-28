var db = require('./db');

function runQuery(query, params) {
    return new Promise((resolve, reject) => {
        db.query(query, params, function (err, result, fields) {
            if (err) {
                console.error(err); // Print error to the console for debugging
                reject(err);
            } else {
                console.log(result); // Print result to the console for debugging
                resolve(result);
            }
        });
    });
}

module.exports = {
    runQuery: runQuery
};