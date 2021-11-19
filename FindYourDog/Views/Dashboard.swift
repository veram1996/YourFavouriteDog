//
//  Dashboard.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//

import SwiftUI
import Kingfisher

struct Dashboard: View {
    @StateObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(0..<(dashboardViewModel.dogsBreeds?.count ?? 0), id: \.self) { index in
                    NavigationLink(destination: DetailsView(dogsBreed: dashboardViewModel.dogsBreeds?[index])) {
                        HStack(alignment: .top) {
                            KFImage.url(URL(string: dashboardViewModel.dogsBreeds?[index].image?.url ?? "")!)
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .center)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    Text("Name : ")
                                        .font(.callout)
                                        .foregroundColor(Color.gray)
                                    Text(dashboardViewModel.dogsBreeds?[index].name ?? "")
                                }
                                HStack(alignment: .top) {
                                    Text("Origin : ")
                                        .font(.callout)
                                        .foregroundColor(Color.gray)
                                    Text(dashboardViewModel.dogsBreeds?[index].origin ?? "---")
                                }
                                HStack(alignment: .top) {
                                    Text("Life Span : ")
                                        .font(.callout)
                                        .foregroundColor(Color.gray)
                                    Text(dashboardViewModel.dogsBreeds?[index].lifeSpan ?? "---")
                                }
                                
                            }
                            .padding(.bottom, 15)
                        }
                    }
                }
            }
            .animation(.easeIn)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarTitle("Find Your Favourite Dog")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                dashboardViewModel.getListOfBreed()
            })
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("background"))
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(dashboardViewModel: DashboardViewModel())
    }
}
