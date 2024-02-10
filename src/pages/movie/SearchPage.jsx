// eslint-disable-next-line no-unused-vars
import React, { useEffect, useState } from "react"
import Navbar from "../../components/layout/Navbar"
import axios from "axios"
import Loading from "../../components/feedback/Loading"
import MovieCard from "../../components/card/MovieCard"
import { formatDate } from "../../helper/Helper"
import { useLocation } from "react-router-dom"
import { useTheme } from "../../theme/ThemeProvider"
import Footer from "../../components/layout/Footer"

const SearchPage = () => {
  const [data, setData] = useState([])
  const [isLoading, setIsLoading] = useState(false)
  const [page, setPage] = useState(1)
  const location = useLocation()
  const {theme} = useTheme()
  const key = new URLSearchParams(location.search).get("key")
  const token = import.meta.env.VITE_TMDB_API_RAT

  const getData = async () => {
    setIsLoading(true)
    axios
      .get(
        `https://api.themoviedb.org/3/search/movie?query=${key}&include_adult=false&language=en-US&page=${page}`,
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      )
      .then((res) => {
        const newData = res.data.results

        setData((prevData) => [...prevData, ...newData])
      })
      .catch((err) => {
        console.log(err)
      })
      .finally(() => {
        setIsLoading(false)
      })
  }

  const handlePageChange = (newPage) => {
    setPage(newPage)
  }

  useEffect(() => {
    console.log('key', key)
    getData()
  }, [page])

  return (
    <div className={`flex-col w-full ${theme == 'dark' ? 'bg-black-1' : 'bg-white-1'} min-h-screen`}>
      <Navbar />

      <div className={`flex flex-col lg:py-40 lg:px-50 lg:gap-10 sm:py-24 sm:px-14 sm:gap-10 py-16 px-5 gap-5`}>
      <h2 className={`${theme == 'dark' ? 'text-soft-white' : 'text-gray'} self-center font-semibold`}>Search &apos;{key}&apos;</h2>
          <div className="w-full h-full flex flex-wrap justify-center items-center lg:gap-7 sm:gap-7 gap-5">
            {/* list film */}
            {data.map((item) => (
              <MovieCard
                key={item.id}
                id={item.id}
                poster={`https://image.tmdb.org/t/p/w500${item.poster_path}`}
                title={item.title}
                rate={item.vote_average * 10}
                votes={item.vote_count}
                date={formatDate(item.release_date)}
              />
            ))}
          </div>

          {isLoading ? <Loading /> : (
            <div className={`flex ${theme == 'dark' ? 'text-soft-white' : 'text-gray'} justify-center items-center`}>
            {data.length > 0 ? (
                <button onClick={(e) => 
                    {
                      e.preventDefault()
                      handlePageChange(page + 1)
                    }
                  } type="button">
                    Load More
                  </button>
            ) : (
                <p className="text-soft-white">No Results</p>
            )}
          </div>
          )}
      </div>

      <Footer />
    </div>
  )
}

export default SearchPage
