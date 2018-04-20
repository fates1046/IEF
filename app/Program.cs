using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Linq;

namespace MonteCarlo
{
    class Program
    {
        public static decimal LogReturnAvgMin { get; set; } = -0.2m;
        public static decimal LogReturnAvgMax { get; set; } = 0.3m;
        public static decimal LogReturnVolMin { get; set; } = 0.2m;
        public static decimal LogReturnVolMax { get; set; } = 0.4m;

        public static decimal WaveHeightMin { get; set; } = 0.1m;
        public static decimal WaveHeightMax { get; set; } = 0.3m;
        public static decimal WaveFrequencyMin { get; set; } = 360m;
        public static decimal WaveFrequencyMax { get; set; } = 720m;

        public static List<decimal> YearlyLogReturnAvg = new List<decimal>(100);
        public static List<decimal> YearlyLogReturnVol = new List<decimal>(100);

        public static List<decimal> DailyLogReturnAvg = new List<decimal>(100);
        public static List<decimal> DailyLogReturnVol = new List<decimal>(100);

        public static List<decimal> WaveHeight = new List<decimal>(100);
        public static List<decimal> WaveFrequency = new List<decimal>(100);
        public static List<decimal> WaveStartHeight = new List<decimal>(100);

        public static List<List<decimal>> AdjAvg = new List<List<decimal>>(100);
        public static List<List<decimal>> DailyLogReturn = new List<List<decimal>>(100);
        public static List<List<decimal>> DailyReturn = new List<List<decimal>>(100);

        public static decimal MinNavPortion = -0.2m;
        public static decimal MaxNavPortion = 0.2m;
        public static decimal NewcomerNavPortion = 0.1m;
        public static decimal TransferFundNorm = 0.005m;

        private static Random random = new Random((int)DateTime.Now.Ticks & 0x0000FFFF);
        public static int[] ManagerArray { get; set; }
        public static int[] InvestorArray { get; set; }
        public static decimal[] InvestorMoneyArray { get; set; }
        public static decimal[] InvestorAddMoneyArray { get; set; }
        public static decimal[] InvestorRemoveMoneyArray { get; set; }


        // 수익률 관련 데이터
        public static List<List<decimal>> StdIndex = new List<List<decimal>>(100);
        public static List<List<decimal>> MonthReturn = new List<List<decimal>>(100);
        public static List<List<decimal>> QuarterReturn = new List<List<decimal>>(100);
        public static List<List<decimal>> YearReturn = new List<List<decimal>>(100);
        public static List<List<decimal>> QuarterLogReturnAvg = new List<List<decimal>>(100);
        public static List<List<decimal>> QuarterLogReturnVol = new List<List<decimal>>(100);
        public static List<List<decimal>> QuarterMDD = new List<List<decimal>>(100);

        // scoring관련 데이터
        public static List<List<decimal>> ScoringPerformance1M = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringPerformance1Q = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringPerformance1Y = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringPerformanceTotal = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringStabilityVol = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringStabilityMDD = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringStabilityTotal = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringQualityCommunity = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringQualityIEFTeam = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringQualityTotal = new List<List<decimal>>(100);
        public static List<List<decimal>> ScoringTotal = new List<List<decimal>>(100);

        // FundFlow
        public static List<List<decimal>> DailyFundFlow = new List<List<decimal>>(100);


        // AUM 데이터
        public static List<List<decimal>> ManagerBeforeAUM = new List<List<decimal>>(100);
        public static List<List<decimal>> ManagerAUMFundFlow = new List<List<decimal>>(100);
        public static List<List<decimal>> ManagerAUMAllocation = new List<List<decimal>>(100);
        public static List<List<decimal>> ManagerAUMFee = new List<List<decimal>>(100);
        public static List<List<decimal>> ManagerAfterAUM = new List<List<decimal>>(100);
        public static List<List<decimal>> TotalFundBeforeAUM = new List<List<decimal>>(100);
        public static List<List<decimal>> TotalFundAUMFundFlow = new List<List<decimal>>(100);
        public static List<List<decimal>> TotalFundAUMAllocation = new List<List<decimal>>(100);
        public static List<List<decimal>> TotalFundAUMFee = new List<List<decimal>>(100);
        public static List<List<decimal>> TotalFundAfterAUM = new List<List<decimal>>(100);


        public static void Temp()
        {
           

            //DataTable dt = new DataTable("logReturn");
            //using (var client = new SqlConnection(connectionString))
            //{
            //    client.Open();
            //    SqlCommand cmd = new SqlCommand("select * from temp_logreturn", client);

            //    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            //    {
            //        da.Fill(dt);
            //        cmd.ExecuteNonQuery();
            //    }

            //}




            //Console.WriteLine("Data Count = " + dt.Rows.Count);


        }

        private static void CreateManagerData()
        {
            Random rnd = new Random((int)DateTime.Now.Ticks & 0x0000FFFF);

            //100명 매니져,10000일 데이터 생성
            for (int i = 0; i < 100; i++)
            {
                var yearlyLogReturnAvg = (decimal)rnd.NextDouble() * (LogReturnAvgMax - LogReturnAvgMin) + LogReturnAvgMin;
                YearlyLogReturnAvg.Add(yearlyLogReturnAvg);

                var dailyLogReturnAvg = yearlyLogReturnAvg / 365;
                DailyLogReturnAvg.Add(dailyLogReturnAvg);

                var yearlyLogReturnVol = (decimal)rnd.NextDouble() * (LogReturnVolMax - LogReturnVolMin) + LogReturnVolMin;
                YearlyLogReturnVol.Add(yearlyLogReturnVol);

                var dailyLogReturnVol = yearlyLogReturnVol / (decimal)Math.Pow(365, 0.5);
                DailyLogReturnVol.Add(dailyLogReturnVol);

                var waveHeight = (decimal)rnd.NextDouble() * (WaveHeightMax - WaveHeightMin) + WaveHeightMin;
                WaveHeight.Add(waveHeight);

                var waveFrequency = (decimal)rnd.NextDouble() * (WaveFrequencyMax - WaveFrequencyMin) + WaveFrequencyMin;
                WaveFrequency.Add(waveFrequency);

                var waveStartHeight = (decimal)rnd.NextDouble();
                WaveStartHeight.Add(waveStartHeight);

                AdjAvg.Add(new List<decimal>());
                DailyLogReturn.Add(new List<decimal>());
                DailyReturn.Add(new List<decimal>());

                //10000일
                for (int j = 0; j < 10000; j++)
                {
                    var adjAvg = dailyLogReturnAvg + (waveHeight * (decimal)Math.Sin(j * (double)(2 * 3.141592m) / (double)(waveFrequency + waveStartHeight * (2 * 3.141592m))));

                    AdjAvg[i].Add(adjAvg);

                    var dailyLogReturn = (decimal)NormalInv.NormInv(rnd.NextDouble(), (double)adjAvg, (double)DailyLogReturnVol[i]);
                    DailyLogReturn[i].Add(dailyLogReturn);

                    DailyReturn[i].Add((decimal)Math.Exp((double)dailyLogReturn) - 1);

                    // 수익률등 계산
                    if (j == 0) { StdIndex[i].Add((decimal)100); }
                    else { StdIndex[i].Add((decimal)StdIndex[i][j - 1] * (1 + DailyReturn[i][j])); }

                    if (j < 30)
                    {
                        MonthReturn[i].Add((decimal)0);
                    }
                    else { MonthReturn[i].Add(StdIndex[i][j] / StdIndex[i][j - 30] - 1); }

                    if (j < 90)
                    {
                        QuarterReturn[i].Add((decimal)0);
                        QuarterLogReturnAvg[i].Add((decimal)0);
                        QuarterLogReturnVol[i].Add((decimal)0);
                        QuarterMDD[i].Add((decimal)0);
                    }
                    else
                    {
                        QuarterReturn[i].Add(StdIndex[i][j] / StdIndex[i][j - 90] - 1);
                        var SumQuarterLogReturn = (decimal)0;
                        for (int k = 0; k < 90; k++)
                        {
                            SumQuarterLogReturn = SumQuarterLogReturn + DailyLogReturn[i][j - k];
                        }
                        QuarterLogReturnAvg[i].Add((decimal)SumQuarterLogReturn / 90);
                        var SumSquaredDeviation = 0m;
                        for (int k = 0; k < 90; k++)
                        {
                            SumSquaredDeviation = SumSquaredDeviation + (decimal)Math.Pow((double)(DailyLogReturn[i][j - k] - QuarterLogReturnAvg[i][j]), 2);
                        }
                        QuarterLogReturnVol[i].Add((decimal)Math.Pow((double)SumSquaredDeviation / 90, 0.5));
                        var QuarterMaximumStdIndex = (decimal)0;
                        for (int k = 0; k < 90; k++)
                        {
                            if (StdIndex[i][j - k] > QuarterMaximumStdIndex) { QuarterMaximumStdIndex = StdIndex[i][j - k]; }
                        }
                        QuarterMDD[i].Add((decimal)StdIndex[i][j] / QuarterMaximumStdIndex - 1);
                    }

                    if (j < 360) { YearReturn[i].Add((decimal)0); }
                    else { YearReturn[i].Add(StdIndex[i][j] / StdIndex[i][j - 360] - 1); }

                }
            }
        }


        public static decimal zscore(decimal item, decimal[] group)
        {
            decimal sum = 0;
            for (int i = 0; i < group.Length; i++)
            {
                sum = sum + group[i];
            }
            var avg = sum / group.Length;
            var squaresum = 0m;
            for (int i = 0; i < group.Length; i++)
            {
                squaresum = squaresum + (decimal)Math.Pow((double)(group[i] - avg), 2);
            }
            var stdev = Math.Pow((double)(squaresum / group.Length), 0.5);
            var zscoreresult = (item - avg) / (decimal)stdev;
            return zscoreresult;
        }


        private static void DBInsertManagerData()
        {
            ///
            var connectionString = "server=142.150.208.207;uid=SA;pwd=F1rstPa55;database=IEF;";

            using (var client = new SqlConnection(connectionString))
            {
                client.Open();

                Console.WriteLine("Starting..");

                //manager
                for (int i = 0; i < 100; i++)
                {
                    //day
                    for (int k = 0; k < 10; k++)
                    {
                        StringBuilder insertQueryTail = new StringBuilder(9999999);
                        for (int j = 0; j < 1000; j++)
                        {
                            insertQueryTail.Append("('" + j + "','" +
                                i + "','" +
                                DailyLogReturn[i][k * j + j].ToString() + "','" +
                                DailyReturn[i][k * j + j].ToString() + "'),");

                        }
                        Console.WriteLine("insert Query {0} Doen.", i.ToString());

                        insertQueryTail = insertQueryTail.Remove(insertQueryTail.Length - 1, 1);
                        insertQueryTail.Append(";");

                        SqlCommand cmd = new SqlCommand("insert into  temp_logreturn(colDayNum,colManager,colLogReturn,colReturn) VALUES " + insertQueryTail, client);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
        


        public static string RandomString(int length)
        {
            const string chars = "abcdefghijklmnopqrstuvwxyz#!@*ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private static void DBInsertMemberData()
        {
            var connectionString = "server=142.150.208.207;uid=SA;pwd=F1rstPa55;database=IEF;";
          
            using (var client = new SqlConnection(connectionString))
            {
                client.Open();

                //member
                StringBuilder insertQueryTail = new StringBuilder(9999999);

                for (int i = 0; i < 100; i++)
                {
                   
                    
                    string memIndex = i.ToString();
                    string joinDate = "20180420";
                    string memType = "2";
                    string userName = "UserName" + (i + 1).ToString();
                    string email = "Email" + (i + 1).ToString() + "@Domain.com";
                    string wallet = RandomString(10);

                        insertQueryTail.Append("('" + memIndex + "','" +
                            joinDate + "','" +
                            memType + "','" +
                            userName + "','"+
                            email + "','"+
                            wallet + "'),");
                }

                insertQueryTail = insertQueryTail.Remove(insertQueryTail.Length - 1, 1);
                insertQueryTail.Append(";");

                SqlCommand cmd = new SqlCommand("insert into  Membership(MemIndex,JoinDate,MemType,UserName,Email,WalletAddress) VALUES " + insertQueryTail, client);

                cmd.ExecuteNonQuery();
            }
        }


        private static void DBInsertInvestorData()
        {
            var connectionString = "server=142.150.208.207;uid=SA;pwd=F1rstPa55;database=IEF;";

            using (var client = new SqlConnection(connectionString))
            {
                client.Open();

                Console.WriteLine("Starting..");

                int index = 100;
                //member
                for (int i = 0; i < 10; i++)
                {
                    StringBuilder insertQueryTail = new StringBuilder(9999999);

                    for (int j = 0; j < 1000;j++)
                    {
                        string memIndex = index.ToString();
                        string joinDate = "20180420";
                        string memType = "1";
                        string userName = "UserName" + (index+1).ToString();
                        string email = "Email" + (index+1).ToString() + "@Domain.com";
                        string wallet = RandomString(10);

                        insertQueryTail.Append("('" + memIndex + "','" +
                            joinDate + "','" +
                            memType + "','" +
                            userName + "','" +
                            email + "','" +
                            wallet + "'),");

                        index++;
                    }

                    insertQueryTail = insertQueryTail.Remove(insertQueryTail.Length - 1, 1);
                    insertQueryTail.Append(";");

                    SqlCommand cmd = new SqlCommand("insert into  Membership(MemIndex,JoinDate,MemType,UserName,Email,WalletAddress) VALUES " + insertQueryTail, client);

                    cmd.ExecuteNonQuery();


                }

               
            }
        }
       

        private static int[] ChangeValueIndex(int[] arraySrc,int index,int min,int max)
        {
            int[] arrDest = arraySrc;

            while(true)
            {
                arrDest[index] = random.Next(min, max);

                if (1 < arrDest.Count(x => x == arrDest[index] ))
                {
                    
                    continue;
                }
                else
                {
                    break;
                }

            }

            return arrDest;

        }

        private static int[]  GetRandomManager(int count,int min,int max)
        {
            int[] managerArray = new int[count];

            for (int i = 0; i < managerArray.Length;i++)
            {
                managerArray[i] = -1;
            }

            for(int i=0;i<managerArray.Length;i++)
            {
                managerArray[i] = random.Next(min, max);

                if( 1 < managerArray.Count(x=>x == managerArray[i] && managerArray[i] != -1))
                {
                   i--;
                   continue;
                }
            }

            return managerArray;

        }

       private static int[] GetRandomInvestor(int count,int min,int max)
        {
            int[] investorArray = new int[count];

            for (int i = 0; i < investorArray.Length; i++)
            {
                investorArray[i] = -1;
            }

            for (int i = 0; i < investorArray.Length; i++)
            {
                investorArray[i] = random.Next(min, max);

                if (1 < investorArray.Count(x => x == investorArray[i] && investorArray[i] != -1))
                {
                    i--;
                    continue;
                }
            }

            return investorArray;
        }

        private static decimal[] GetRandomInvestorInitAddMoney(int count)
        {
            decimal[] investorInitAddMoneyArray = new decimal[count];

            for (int i = 0; i < investorInitAddMoneyArray.Length; i++)
            {
                investorInitAddMoneyArray[i] = 0;
            }

            return investorInitAddMoneyArray;
        }

        private static decimal[] GetRandomInvestorInitRemoveMoney(int count)
        {
            decimal[] investorInitRemoveMoneyArray = new decimal[count];

            for (int i = 0; i < investorInitRemoveMoneyArray.Length; i++)
            {
                investorInitRemoveMoneyArray[i] = 0;
            }

            return investorInitRemoveMoneyArray;
        }

        private static void SetRandomInvestorAddMoney(int count)
        {
            for (int i = 0; i < 10 ; i++)
            {
                int index = random.Next(count);
                decimal addMoney = (decimal)(random.NextDouble() * 20000);
                InvestorAddMoneyArray[index] += addMoney;
                InvestorMoneyArray[index] += addMoney;
            }
        }

        private static void SetRandomInvestorRemoveMoney(int count)
        {

            for (int i = 0; i < 10; i++)
            {
                int index = random.Next(count);
                InvestorRemoveMoneyArray[index] += (decimal)(random.NextDouble() * 20000);

                if(InvestorMoneyArray[index] < InvestorRemoveMoneyArray[index])
                {
                    InvestorRemoveMoneyArray[index] = InvestorMoneyArray[index];
                    InvestorMoneyArray[index] = 0;
                }
                else
                {
                    InvestorMoneyArray[index] -= InvestorRemoveMoneyArray[index];
                }
            }
        }

        private static decimal[] GetRandomInvestorMoney(int count)
        {
            decimal[] investorMoneyArray = new decimal[count];

            for (int i = 0; i < investorMoneyArray.Length; i++)
            {
                investorMoneyArray[i] = -1;
            }

            for (int i = 0; i < investorMoneyArray.Length/2; i++)
            {
                investorMoneyArray[i] = (decimal)(random.NextDouble()*20000);

                if (1 < investorMoneyArray.Count(x => x == investorMoneyArray[i] && investorMoneyArray[i] != -1))
                {
                    i--;
                    continue;
                }
            }

            for(int i = 0;i<investorMoneyArray.Length/2;i++)
            {
                investorMoneyArray[investorMoneyArray.Length / 2 + i] = 20000 - investorMoneyArray[i];
            }

            return investorMoneyArray;
        }



        static int Main(string[] args)
        {
            CreateManagerData();
            //DBInsertManagerData();

            //DBInsertMemberData();
            //DBInsertInvestorData();

            StdIndex.Add(new List<decimal>());
            MonthReturn.Add(new List<decimal>());
            QuarterReturn.Add(new List<decimal>());
            YearReturn.Add(new List<decimal>());
            QuarterLogReturnAvg.Add(new List<decimal>());
            QuarterLogReturnVol.Add(new List<decimal>());
            QuarterMDD.Add(new List<decimal>());
            DailyFundFlow.Add(new List<decimal>());

            ScoringPerformance1M.Add(new List<decimal>());
            ScoringPerformance1Q.Add(new List<decimal>());
            ScoringPerformance1Y.Add(new List<decimal>());
            ScoringPerformanceTotal.Add(new List<decimal>());
            ScoringStabilityVol.Add(new List<decimal>());
            ScoringStabilityMDD.Add(new List<decimal>());
            ScoringStabilityTotal.Add(new List<decimal>());
            ScoringQualityCommunity.Add(new List<decimal>());
            ScoringQualityIEFTeam.Add(new List<decimal>());
            ScoringQualityTotal.Add(new List<decimal>());
            ScoringTotal.Add(new List<decimal>());


            InvestorMoneyArray = new decimal[100];
            InvestorAddMoneyArray = new decimal[100];
            InvestorRemoveMoneyArray = new decimal[100];
            
            for(int i = 0; i < InvestorMoneyArray.Length; i++)
            {
                InvestorMoneyArray[i] = 0;
                InvestorAddMoneyArray[i] = 0;
                InvestorRemoveMoneyArray[i] = 0;
            }
           
            ManagerArray = GetRandomManager(10, 0, 100);
            ManagerArray = ChangeValueIndex(ManagerArray, 1, 0, 100);

            InvestorArray = GetRandomInvestor(100, 100, 10100);
            InvestorMoneyArray = GetRandomInvestorMoney(100);


            SetRandomInvestorAddMoney(100);
            SetRandomInvestorRemoveMoney(100);

            Console.WriteLine("Done.");
            Console.ReadLine();

            return 1;

        }
    }
}
