namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task deals_csv: :environment do
        
        require 'open-uri'
        require 'date'
        require 'uri'
        require 'net/http'
        require 'openssl'
        require 'json'
        require 'csv'
        require 'pp'
        
        require "csv"
        require 'nokogiri'
        require 'httparty'
        require 'json'

        CSV.foreach("csv/deals1.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

        
            a=([
                team_id: Team.find_by_name(row[0]).id,
                name: row[1],
                chain: row[2],
                deal_stage_id: DealStage.find_by_name(row[3]).id,
                state: row[4],
                tte_servicing_pharmacy: row[5],
                total_residential_individuals: row[6],
                probability_of_close: row[7],
                go_live_date: row[8],
                incumbent_pharmacy: row[9],
                delivery_type: row[10],
                comments: row[11],
                pipeline_date: row[12],
                forecasted_individuals: row[13],
                objectid: row[14]
            ])

            b = Deal.create(a)

            pp b

        end
        
   
      end
    end
  end