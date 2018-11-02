const db = require('./database');

module.exports = function readAllNewsletters(req: any, res: any) {
  res.status(200).json(db.readAllTodos());

}
