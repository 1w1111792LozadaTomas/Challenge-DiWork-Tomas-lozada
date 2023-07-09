using TallerMecanico.Models;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;
using System.Text.RegularExpressions;
using TallerMecanico.Models.DTOs;


namespace TallerMecanico.Datos
{
    public class ReporteDatos
    {
        public List<Reporte1DTO> Reporte1()
        {
            var oLista = new List<Reporte1DTO>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("RPT_1", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            oLista.Add(new Reporte1DTO(
                            Convert.ToString(dr["Marca"]),
                            Convert.ToString(dr["Nombre"]),
                            Convert.ToInt32(dr["Precio"]),
                            Convert.ToInt32(dr["Cantidad"])));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return oLista;
        }

        public List<Reporte2DTO> Reporte2()
        {
            var oLista = new List<Reporte2DTO>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("RPT_2", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            oLista.Add(new Reporte2DTO(
                            Convert.ToString(dr["Marca"]),
                            Convert.ToDouble(dr["Promedio"])));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return oLista;
        }

        public List<Reporte3DTO> Reporte3()
        {
            var oLista = new List<Reporte3DTO>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("RPT_3", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            oLista.Add(new Reporte3DTO(
                            Convert.ToString(dr["Tipo"]),
                            Convert.ToDouble(dr["SumatoriaPresupuesto"])));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return oLista;
        }
    }
}
