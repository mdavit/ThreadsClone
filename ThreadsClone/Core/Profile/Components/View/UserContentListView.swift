//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 10.11.23.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct UserContentListView_Preview: PreviewProvider {
    static var previews: some View {
        UserContentListView(user: dev.user)
    }
}
