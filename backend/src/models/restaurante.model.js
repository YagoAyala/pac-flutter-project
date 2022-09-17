import { ObjectId } from 'mongodb';
import connection from './mongoConnection';

const getAll = async () => {
  const db = await connection();
  return db.collection('restaurantes').find().toArray();
};

const newRestaurante = async ({ nome }) => {
  const db = await connection();
  const user = await db.collection('restaurantes').insertOne({ nome });
  const { insertedId: _id } = user;
  return { nome, _id };
};

const restauranteExists = async ({ nome, id }) => {
  const db = await connection();
  let restaurant = null;
  if (id) {
    restaurant = await db.collection('restaurantes').findOne({ _id: ObjectId(id) });
  } else {
    restaurant = await db.collection('restaurantes').findOne({ nome });
  }
  return restaurant;
};

const deleta = async ({ id }) => {
  const db = await connection();
  await db.collection('restaurantes').deleteOne({ _id: ObjectId(id) });
  return { id };
};

const update = async ({ id, nome }) => {
  const db = await connection();
  await db.collection('restaurantes').updateOne({ _id: ObjectId(id) }, { $set: { nome } });
  return { id, nome };
};

export {
  getAll, newRestaurante, restauranteExists, deleta, update,
};
