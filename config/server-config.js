module.exports = {
    env: 'development',
    dbServer: 'http://couchdb',
    db: 'chronicle',
    dbPort: process.env.PORT || 5984,
    auth: 'none',
    logger: true,
  };