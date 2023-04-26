import type { VercelRequest, VercelResponse } from "@vercel/node";

import axios from "axios";

const url = "https://worldgolfranking2021api.wagr.com/api/wagr/rankings/getRankings?rankingsType=0&pageNumber=1&week=0&year=2021&region=0&countries=&playerName=&county=&pageSize=50&playerIDs=&age=25&asOfDate=2023-09-09&includeFirstStats=false&sortString=&isRangeUnder=false&isRangeOver=true&isThisAgeOnly=false&date=";

export default async function handler(
  request: VercelRequest,
  response: VercelResponse
){
  const wagrResponse = await axios.get(url)

  response.status(200).json(wagrResponse.data);
}
