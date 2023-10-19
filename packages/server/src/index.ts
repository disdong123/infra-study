import dotenv from 'dotenv';
dotenv.config({
  path: `.env.${process.env.APP_ENV}`,
});
import express from 'express';
import expressAsyncHandler from 'express-async-handler';
import { memberRepository } from '@disdong/common';

const app = express();
const port = 3000;

app.get('/health', (req, res) => {
  console.log('/health is called');
  res.send('health check!');
});

app.get(
  '/members/:id',
  expressAsyncHandler(async (req, res) => {
    console.log('/members is called');
    res.send({
      member: await memberRepository.getMember(req.params.id),
    });
  }),
);

app.post(
  '/members',
  expressAsyncHandler(async (req, res) => {
    console.log('/members is called');
    await memberRepository.setMember(req.body.id);
    res.send('success');
  }),
);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
