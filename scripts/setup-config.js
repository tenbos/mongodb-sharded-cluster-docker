rs.initiate({
  _id: "configReplSet",
  configsvr: true,
  members: [
    { _id: 0, host: "mongo-config-0:27019" },
    { _id: 1, host: "mongo-config-1:27019" },
    { _id: 2, host: "mongo-config-2:27019" }
  ]
});
