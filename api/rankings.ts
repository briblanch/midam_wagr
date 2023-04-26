import type { VercelRequest, VercelResponse } from "@vercel/node";

import axios from "axios";

const url = "https://worldgolfranking2021api.wagr.com/api/wagr/rankings/getRankings?rankingsType=0&pageNumber=1&week=0&year=2021&region=0&countries=&playerName=&county=&pageSize=50&playerIDs=&age=25&asOfDate=2023-09-09&includeFirstStats=false&sortString=&isRangeUnder=false&isRangeOver=true&isThisAgeOnly=false&date=";

async function handler(
  request: VercelRequest,
  response: VercelResponse
){
  const wagrResponse = await axios.get(url)

  response.status(200).json(wagrResponse.data);
}

const allowCors = fn => async (req, res) => {
  res.setHeader('Access-Control-Allow-Credentials', true)
  res.setHeader('Access-Control-Allow-Origin', '*')
  // another common pattern
  // res.setHeader('Access-Control-Allow-Origin', req.headers.origin);
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT')
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
  )
  if (req.method === 'OPTIONS') {
    res.status(200).end()
    return
  }
  return await fn(req, res)
}

module.exports = allowCors(handler);
