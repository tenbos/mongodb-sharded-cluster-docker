rs.initiate({
  _id: "rs1",
  members: [
    { _id: 0, host: "mongo-data-3:27018" },
    { _id: 1, host: "mongo-data-4:27018" },
    { _id: 2, host: "mongo-data-5:27018" }
  ]
});
