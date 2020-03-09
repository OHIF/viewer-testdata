module.exports = {
    env: 'development',
    dbServer: 'http://0.0.0.0',
    db: 'chronicle',
    dbPort: process.env.PORT || 5984,
    auth: 'none',
    logger: true,
  };